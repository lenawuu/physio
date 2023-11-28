# Physio
## Inspiration
Physio was designed to streamline patients' physical therapy. Most routines are handed from doctor to patient as paper handouts with static diagrams and handwritten notes. We wanted to create an app that consolidates all the necessary exercise information, reminds patients to do their workouts, and even guides them in maintaining correct form and posture.

## What Physio does
Physio enhances physical therapy in several ways:
* **AR Excercise Walkthrough:** Users are provided stage-by-stage posture guides to teach beginners and ensure they perform exercises correctly. Physio can detect how accurately a user’s pose is compared to a professional’s and provide visual adjustment indicators.
* **Comprehensive exercise database:** Using data from the website [RehabHero](https://www.rehabhero.ca/exercise), we developed a comprehensive database complete with textual directions, video examples, and additional exercise information.
* **Routine builder:** Users can add these exercises from the database to a custom routine with adjustable sets and reps. Users can also set a reminder time to be notified to complete their daily physical therapy routine.

## How we built Physio
Physio's front end was developed with the Flutter framework, specifically through FlutterFlow. Our stage-based walkthrough program primarily relies on preprocessed exercise data, a computer vision library, and a pose detection model (developed by Google).

## Challenges we ran into
* Preprocessing exercise MP4s into JSON data to compare against user pose input
* Developing an algorithm to compare user form against example exercise form
* Implementing a color-coded visual feedback system for limb positions
* Establishing app backend (data schemas, storing exercises, app state management)
* Passing information between app pages
* Virtual collaboration (scheduling calls, using Github, project management)
* Configuring development environment - setting up Flutter, iOS simulation

## Accomplishments that we're proud of
* Successfully developing a live exercise walkthrough program
* Navigable, intuitive app UI
* Successfully handling app backend data

## What we learned
Mobile app development is complex! But possible through much trial and error.

## What's next for Physio
* Live analysis in addition to stage-based analysis (think Just Dance or Wii Fit)
* Generation of post-exercise reports to share with physical therapy providers
* Expansive customization options for the exercise walk-through, such as adjusting speed or form thresholds
* Render 3D pose models rather than a simple skeleton (like Wii Fit trainers!)
* More customization with routine scheduling (ie on certain days, multiple times a day)
