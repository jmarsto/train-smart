# TrainSmart

This app was built as the culmination of my experience at Launch Academy. (https://launchacademy.com/)

It generates custom training plans for rock climbers based on their answers to a ten step self-assessment.
It is deployed on Heroku at:

### https://trainsmart.herokuapp.com/
###

Sign-up is easy, and the user is immediately given a 10 step self-assessment to analyze their strengths and weaknesses as a rock-climber.

Upon submission, a personalized training plan is generated from their answers.

The user can then read about the different suggested exercises which are laid out for them in calendar form, and they can edit their answers to generate a new training plan.

They can also edit their plans with drag 'n' drop, and I hope to eventually be able to export them as google calendars.

* The app is built on Rails, with a React front-end.
* User authentication is handled with Devise. (https://github.com/plataformatec/devise)
* The informational modals were created with react-modal (https://github.com/reactjs/react-modal)
* Exercises can be dragged and dropped with react-beautiful-dnd (https://github.com/atlassian/react-beautiful-dnd/)
