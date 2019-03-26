class Events::SearchController < ApplicationController
  STEPS = {
    "posee_dynamique" => {
      question: "Plutot soirée posée ou soirée dynamique?",
      answers: ["posee", "dynamique"]
    },

    "combien_persones" => {
      question: "Est-tu seul, à deux ou en groupe ?",
      answers: ["seul", "couple", "groupe"]
    },

    "musique_activite" => {
      question: "Plutot ecouter de la musique et danser ou faire une activité?",
      answers: ["activite", "musique"]
    },

    "combien_coute" => {
      question: "Est-tu pret à payer quelques € ou c'est la deche?",
      answers: ["chere", "bon_marche"]
    },

    "ritme_activite" => {
      question: "Es-tu pret a bouger un peu?",
      answers: ["activite_sport", "activite_tranquile"]
    },

    "concert" => {
      question: "Quel type de musique?",
      answers: ["electro", "rock", "rap", "latine"]
    },

    "bar_ambiance" => {
      question: "Quel type de musique?",
      answers: ["electro", "rock", "rap", "latine"]
    },

    "changer_idees_rencontre" => {
      question: "Plutot changer les idées ou rencontrer du monde?",
      answers: ["rencontre", "idees"]
    },

    "culture_comptoir" => {
      question: "Plutot culture ou comptoir?",
      answers: ["culture", "comptoir"]
    },

    "boison_musique" => {
      question: "Tu fais plus attention à ce que tu bois ou à l'ambiance musical?",
      answers: ["boison", "musique"]
    },

    "bar_pose_musique" => {
      question: "Quel type de musique?",
      answers: ["tripHop", "rock", "reggae", "soul"]
    },

    "type_culture" => {
      question: "Quel type? Politique, art, histoire, ecologie...",
      answers: ["art", "social", "ecologie", "histoire"]
    },

    "cinema_theatre" => {
      question: "Plutot aller au cinema ou au theatre?",
      answers: ["cinema", "theatre"]
    },

    "cinema" => {
      question: "Quel type de cinema?",
      answers: ["comedie", "drame", "action", "fantasie"]
    },

    "theatre" => {
      question: "Quel type de theatre",
      answers: ["comedie", "drame", "musical", "monologue"]
    }
  }

  NEXT_STEPS = {
    "posee_dynamique" => {
      "posee" =>   "changer_idees_rencontre",
      "dynamique" => "combien_persones"
    },

    "combien_persones" => {
      "seul" => "combien_coute",
      "couple" => "musique_activite",
      "groupe" => "musique_activite"
    },

    "musique_activite" => {
      "activite" => "ritme_activite",
      "musique" => "combien_coute"
    },

    "combien_coute" => {
      "chere" => "concert",
      "bon_marche" => "bar_ambiance"
    },

    "ritme_activite" => nil, # {
    #   "activite_sport" => nil,
    #   "activite_tranquile" => nil
    # },

    "concert" => nil, #{
    #   "electro" => nil,
    #   "rock" => nil,
    #   "rap" => nil,
    #   "latine" => nil
    # },

    "bar_ambiance" => nil, #{
    #   "electro" => nil,
    #   "rock" => nil,
    #   "rap" => nil,
    #   "latine" => nil
    # },

    "changer_idees_rencontre" => {
      "rencontre" => "culture_comptoir",
      "idees" => "cinema_theatre"
    },

    "culture_comptoir" => {
      "culture" => "type_culture",
      "comptoir" => "boison_musique"
    },

    "boison_musique" => {
      "boison" => nil,
      "musique" => "bar_pose_musique"
    },

    "bar_pose_musique" => nil, #{
    #   "tripHop" => nil,
    #   "rock" => nil,
    #   "reggae" => nil,
    #   "soul" => nil
    # },

    "type_culture" => nil, #{
    #   "art" => nil,
    #   "social" => nil,
    #   "ecologie" => nil,
    #   "histoire" => nil
    # },

    "cinema_theatre" => {
      "cinema" => "cinema",
      "theatre" => "theatre"
    },

    "cinema" => nil, #{
    #   "comedie" => nil,
    #   "drame" => nil,
    #   "action" => nil,
    #   "fantasie" => nil
    # },

    "theatre" => nil, #{
      # "comedie" => nil,
      # "drame" => nil,
      # "musical" => nil,
      # "monologue" => nil
    #}
  }

  def show # question
    @step = params[:step] # => On garde en @step le  hash "posee_dynamique" avec ses questions et ses answers

    @question = STEPS[@step][:question] # => On let dans une variable le valeur de :question du STEP
    @answers  = STEPS[@step][:answers] # => pareil que le precedent, mais avec les :answers
  end

  def create # answer
    @step = params[:step] # => On garde en @step le  hash "posee_dynamique" avec ses questions et ses answers

    answer = params[:answer] # => "many"
    session[@step] = answer # => on garde la reponse dans la session pour utiliser apres pour la recherche

    next_step = NEXT_STEPS[@step][answer] if NEXT_STEPS.key?(@step) # => on test si il y a de next_step

    if next_step
      redirect_to events_search_path(step: next_step)
    else
      redirect_to events_path
    end
  end
end
