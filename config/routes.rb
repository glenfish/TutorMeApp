Rails.application.routes.draw do
  devise_for :students, :controllers => {:registrations => "student_registrations", :sessions => "student_sessions"}
  

  devise_for :tutors
  root 'home#index'
  # student_root_path 'student#index'
  # tutor_root_path 'tutor#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'restricted', to: 'home#restricted', as: 'restricted'
  get 'tutors', to: 'members#index', as: 'tutors'
  get 'students', to: 'student#index', as: 'students'
  get 'students/join/', to: 'student#join', as: 'students_join'
end
