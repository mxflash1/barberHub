"""
# TODO

## Planning & Prototype (Before Coding)
- [ ] Define MVP scope strictly from PRD: client profiles, photo-based history, SMS reminders, calendar, camera.
- [ ] Map high-level user flows: add client → capture before/after → analyze → schedule reminder → view calendar.
- [ ] Low-fidelity wireframes for: Client List, Client Detail, Add/Edit Client, Photo Capture (Before/After), Booking Calendar, Reminder Setup.
- [ ] Clickable prototype of the above flows in a design tool.
- [ ] Review prototype and adjust flows/screens as needed.

## Project Setup
- [ ] Create SwiftUI project in Xcode
- [ ] Initialize source control and basic project structure
- [ ] Prepare for camera usage (request permission, add usage description)

## Data & Backend (Choice TBD: Firebase or Supabase)
- [ ] Choose backend: Firebase or Supabase (per README)
- [ ] Define data structures for: Client (name, phone, haircut history), Photos (before/after attached to visits), Bookings, AI Analysis Results
- [ ] Decide where photos are stored initially: locally or in the backend (per README)

## Core Features
- [ ] Build Client model (name, phone, haircut history)
  - [ ] Create data types for client and haircut history
  - [ ] Add basic create/read/update for clients
- [ ] Create ClientListView with dummy data
  - [ ] Display list of clients with basic info
  - [ ] Navigate to Client Detail
- [ ] Client Detail view
  - [ ] Show haircut history and associated photos
  - [ ] Add/edit client info
- [ ] Camera integration for before/after photo capture
  - [ ] Request camera permission
  - [ ] Capture and preview photos
  - [ ] Tag photos to the selected client and the corresponding visit
- [ ] Store photos locally (or in Firebase)
  - [ ] Persist captured photos to the chosen storage
  - [ ] Display stored photos in client history
- [ ] Connect booking calendar
  - [ ] Show bookings in a calendar view
  - [ ] Create bookings from the app
  - [ ] Display bookings added from the web after synchronization
- [ ] Implement manual SMS reminders
  - [ ] Integrate with Twilio (per README)
  - [ ] Send a test SMS reminder to a provided phone number
- [ ] Add AI haircut analysis (API integration)
  - [ ] Send before/after photos to an AI image analysis API (e.g., AWS Rekognition per README)
  - [ ] Store and display analysis results with the visit
- [ ] Train frequency model based on photo timestamps (optional microservice)
  - [ ] Export timestamps from haircut history
  - [ ] Compute predicted return time from timestamps (optional Python microservice per README)
  - [ ] Use the predicted return time for SMS reminder scheduling

## Optional Features
- [ ] Predict return time using AI (see optional microservice above)
- [ ] Web-based booking form that syncs to app
- [ ] Auto-tag haircut styles from photos

## QA / Validation
- [ ] Validate all acceptance criteria in PRD for each core feature
- [ ] Confirm camera capture works and photos associate with correct visits
- [ ] Confirm SMS reminders send successfully via Twilio
- [ ] Confirm calendar shows both app-created and web-created bookings (after sync)

## Bugs / Fixes
(none yet)
"""