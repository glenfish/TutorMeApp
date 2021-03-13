Rails.application.routes.draw do
  
  devise_for :students, :controllers => {:registrations => "student_registrations", :sessions => "student_sessions"}
  devise_scope :student do
    get '/student/index', to: 'student#index', as: 'student_root'
  end
  devise_for :tutors
  devise_scope :tutor do
    get 'tutors', to: 'members#index', as: 'tutor_root'
  end
  root 'home#index'
  # student_root_path 'student#index'
  # tutor_root_path 'tutor#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'restricted', to: 'home#restricted', as: 'restricted'


  get 'tutors', to: 'members#index', as: 'tutors'
  get '/tutors/profile_form', to: 'members#profile_form', as: 'profile_form'
  post '/tutors/profile_create', to: 'members#profile_create'
  patch '/tutors/profile', to: 'members#profile', as: 'profile'
  patch '/tutors/update_subjects', to: 'members#update_subjects', as: 'update_subjects'
  post '/tutors/create_subjects', to: 'members#create_subjects', as: 'create_subjects'
  delete '/tutors/destroy_subject', to: 'members#destroy_subject', as: 'destroy_subject'

  get 'students', to: 'student#index', as: 'students'
  get 'students/join/', to: 'student#join', as: 'students_join'
  get 'students/search/', to: 'student#search', as: 'search'
  get 'students/tutor_profile/:id', to: 'student#tutor_profile', as: 'student_tutor_profile'
  get 'students/favourite/:id', to: 'student#favourite', as: 'favourite'
  get 'students/make_booking/', to: 'student#make_booking', as: 'make_booking'
  # match '*path' => 'home#index', via: [:get, :post]
  # match "*path", to: redirect('/'), via: :all
end
