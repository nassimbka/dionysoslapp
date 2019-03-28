class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.all
    @answers = session[:search].values

    # # V0 - at least one answer
    # @events = @events.distinct.joins(:tags).where(tags: { name: @answers }).limit(3)

    # # V1 - fail
    # conditions = @answers.map { 'tags.name = ?' }.join(' AND ')
    # @events = @events.distinct.joins(:tags).where(conditions, *@answers).limit(3)

    # V2 - perfect matching
    # @answers.each_with_index do |answer, index|
    #   @events = @events.
    #     joins("INNER JOIN event_tags et_#{index} ON et_#{index}.event_id = events.id").
    #     joins("INNER JOIN tags tags_#{index} ON tags_#{index}.id = et_#{index}.tag_id").
    #     where("tags_#{index}.name = ?", answer)
    # end

    # @events = @events.distinct.limit(3)

    # V3 - best matching
    selection = []
    @answers.each_with_index do |answer, index|
      # ICI on LEFT OUTER JOIN pour garder les events meme s'ils n'ont pas les tags recherchés
      @events = @events.
        joins("LEFT OUTER JOIN event_tags et_#{index} ON et_#{index}.event_id = events.id").
        joins("LEFT OUTER JOIN tags tags_#{index} ON tags_#{index}.id = et_#{index}.tag_id AND tags_#{index}.name = '#{answer}'")

      # si le tag n'est pas présent pour l'event, on compte 0 sinon on compte 1
      selection << "(CASE WHEN tags_#{index}.name IS NULL THEN 0 ELSE 1 END)"
    end

    # la somme des comptes devient la colonne "matching"
    # i.e. pour 4 tags recherchés, un event qui matche tout aura un matching de 4
    selection = "events.*, #{selection.join(' + ')} AS matching"

    # on trie par meilleur matching et on prend les 3 premiers
    @events = @events.distinct.select(selection).order("matching DESC").limit(3)
  end

  def show
    @event = Event.find(params[:id])
  end
end
