class Events::SearchController < ApplicationController
  skip_before_action :authenticate_user!
  FIRST_STEP = "posee_dynamique"

  STEPS = {
    "posee_dynamique" => {
      question: "Soirée posée ou dynamique?",
      answers: ["posée", "dynamique"]
    },

    "combien_personnes" => {
      question: "Solo, à deux ou en groupe?",
      answers: ["solo", "couple", "groupe"]
    },

    "musique_activite" => {
      question: "Ecouter musique/danser ou faire une activité?",
      answers: ["activité", "musique"]
    },

    "combien_coute" => {
      question: "Est-tu pret à payer quelques € ou c'est la dèche?",
      answers: ["payant", "gratuit / prix libre"]
    },

    "ritme_activite" => {
      question: "Sportif ou pas trop?",
      answers: ["sportif", "tranquille"]
    },

    "concert" => {
      question: "Quel type de musique?",
      answers: ["electro", "rock", "hip-Hop", "latino", "jazz", "musiques du monde"]
    },

    "bar_ambiance" => {
      question: "Quel type de musique?",
      answers: ["electro", "rock", "hip-Hop", "latino", "jazz", "musiques du monde"]
    },

    "changer_idees_rencontre" => {
      question: "Regarder ou discuter?", # a changer
      answers: ["regarder", "social"]
    },

    "culture_comptoir" => {
      question: "Plutot culture ou comptoir?",
      answers: ["culture", "comptoir"]
    },

    "boisson_musique" => {
      question: "Tu fais plus attention à ce que tu bois ou à la musique?",
      answers: ["boisson", "musique"]
    },

    "bar_pose_musique" => {
      question: "Quel type de musique?",
      answers: ["soul", "rock", "hip-Hop", "latino", "jazz", "musiques du monde"]
    },

    "type_culture" => {
      question: "Quel type?",
      answers: ["documentaire", "danse", "ecologie", "histoire", "art", "expositions"]
    },

    "cinema_theatre" => {
      question: "Plutot aller au cinéma ou au théâtre?",
      answers: ["cinéma", "théâtre"]
    },

    "cinema" => {
      question: "Quel type de cinéma?",
      answers: ["comedie", "drame", "action", "science-fiction", "romance", "horreur"]
    },

    "theatre" => {
      question: "Quel type de theatre",
      answers: ["comedie", "drame", "musical", "one-man-show"]
    }
  }

  NEXT_STEPS = {
    "posee_dynamique" => {
      "posée" =>   "changer_idees_rencontre",
      "dynamique" => "combien_personnes"
    },

    "combien_personnes" => {
      "solo" => "combien_coute",
      "couple" => "musique_activite",
      "groupe" => "musique_activite"
    },

    "musique_activite" => {
      "activité" => "ritme_activite",
      "musique" => "combien_coute"
    },

    "combien_coute" => {
      "payant" => "concert",
      "gratuit / prix libre" => "bar_ambiance"
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
      "social" => "culture_comptoir",
      "regarder" => "cinema_theatre"
    },

    "culture_comptoir" => {
      "culture" => "type_culture",
      "comptoir" => "boisson_musique"
    },

    "boisson_musique" => {
      "boisson" => nil,
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
      "cinéma" => "cinéma",
      "théâtre" => "théâtre"
    },

    "cinema" => nil, # {
    #   "comedie" => nil,
    #   "drame" => nil,
    #   "action" => nil,
    #   "fantasie" => nil
    # },

    "theatre" => nil, # {
      # "comedie" => nil,
      # "drame" => nil,
      # "musical" => nil,
      # "monologue" => nil
    #}
  }

  def show # question
    @step = params[:step].presence || FIRST_STEP # => On garde en @step le  hash "posee_dynamique" avec ses questions et ses answers

    @question = STEPS[@step][:question] # => On let dans une variable le valeur de :question du STEP
    @answers  = STEPS[@step][:answers] # => pareil que le precedent, mais avec les :answers
  end

  def create # answer
    @step = params[:step] # => On garde en @step le  hash "posee_dynamique" avec ses questions et ses answers

    answer = params[:answer] # => "many"
    session[@step] = answer # => on garde la reponse dans la session pour utiliser apres pour la recherche

    next_step = NEXT_STEPS[@step][answer] if NEXT_STEPS[@step] # => on test si il y a de next_step

    if next_step
      redirect_to events_search_path(step: next_step)
    else
      redirect_to events_path
    end
  end
end
