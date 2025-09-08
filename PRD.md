"""
# Product Requirements Document (PRD) — Barber Central

This document defines the requirements for Barber Central, a comprehensive barber management system combining an iOS app and customizable website. This system serves as the complete hub for barbers to manage their business operations.

## 1) Overview
- Purpose: A comprehensive barber management system combining iOS app and customizable website
- Platforms: iOS (SwiftUI frontend) + Web platform (customizable website)
- Core capabilities:
  - Complete client management with haircut history and AI analysis
  - Centralized booking calendar with real-time sync between app and website
  - Automated SMS reminders based on client visit patterns
  - Customizable website for online bookings
  - Availability management and client announcements
  - Camera integration for before/after photo capture
- Tech stack:
  - SwiftUI (iOS Frontend)
  - Web technologies (Website Frontend)
  - Firebase or Supabase (Unified Backend)
  - Twilio (SMS)
  - AI image analysis API (e.g., AWS Rekognition)
  - Real-time sync between app and website
- Status: Project pivoting to comprehensive barber management system; requirements being updated

## 2) Goals and Non-Goals
- Goals: 
  - Deliver a complete barber management system with iOS app and customizable website
  - Enable barbers to manage all aspects of their business from one central location
  - Provide seamless integration between web bookings and app calendar
  - Offer automated client communication and reminder system
  - Allow barbers to customize their online presence with branding
- Non-Goals (MVP): 
  - Advanced analytics and reporting features
  - Multi-location management
  - Staff management features
  - Payment processing integration
  - Inventory management

## 3) Primary Users
- **Primary User**: Barber using the iOS app to manage clients, bookings, and business operations
- **Secondary User**: Clients using the barber's website to book appointments online
- **User Scenarios**:
  - Independent barbers looking for complete business management
  - Barbershops wanting to modernize their booking system
  - Barbers who want online presence with full control over their calendar

## 4) Core Features with Requirements and Acceptance Criteria

### 4.1 Client Profiles
- Description: Maintain profiles for clients including photos, preferences, and visit frequency.
- User Story: As a barber, I want to manage client profiles so I can quickly view their details and haircut history.
- Functional Requirements:
  - Create, view, edit client profiles.
  - Store at least: name, phone, haircut history. (As listed in TODO)
  - Support attaching photos to client history. (As listed in README)
  - Represent visit frequency for each client. (As listed in README)
- Acceptance Criteria:
  - A client can be added with name and phone.
  - A client detail view displays their haircut history and related photos.
  - Updating a client’s information persists correctly.

### 4.2 AI-Powered Haircut History Tracking via Before/After Photos
- Description: Track haircuts using before/after photos and AI image analysis.
- User Story: As a barber, I want to capture before and after photos per visit and have AI help track the haircut history.
- Functional Requirements:
  - Capture and associate a pair of photos (before and after) with a client visit.
  - Send photos for analysis to an AI image analysis API. (e.g., AWS Rekognition per README)
  - Store analysis results with the visit in a retrievable way.
- Acceptance Criteria:
  - Before and after photos can be captured and linked to a visit.
  - The app can send the photos to an AI image analysis API and receive results.
  - The analysis results are visible alongside the visit history.

### 4.3 Smart SMS Reminders Based on AI-Predicted Return Times
- Description: Use SMS to remind clients when to return, based on AI-predicted return times.
- User Story: As a barber, I want clients to receive reminders around when they are likely due for a return visit.
- Functional Requirements:
  - Integrate with an SMS provider (Twilio per README) to send reminders.
  - Use the predicted return time to schedule reminder messages. (Prediction source per README TODO: optional Python microservice and training based on photo timestamps)
- Acceptance Criteria:
  - A reminder can be scheduled and sent via SMS.
  - The reminder timing is based on the predicted return time.

### 4.4 Integrated Booking Calendar (Web and App Entries)
- Description: Provide a booking calendar that supports entries from the mobile app and web.
- User Story: As a barber, I want to manage bookings in a calendar that can include entries created from both the app and the web.
- Functional Requirements:
  - Display bookings in a calendar view.
  - Allow creation of bookings from the app and support synchronizing bookings made via the web. (As stated in README)
- Acceptance Criteria:
  - Bookings created in the app are visible in the calendar.
  - Web-created bookings are visible in the app calendar after synchronization.

### 4.5 Camera Integration
- Description: Use the device camera to capture and tag photos for each visit.
- User Story: As a barber, I want to take photos in-app and tag them to the correct client visit.
- Functional Requirements:
  - Request camera access and capture photos.
  - Tag captured photos to the corresponding client and visit.
- Acceptance Criteria:
  - Camera can be used from within the app to take photos.
  - Photos are associated with the correct client and visit record.

## 5) Integrations and Architecture (High-Level)
- Frontend: SwiftUI iOS app.
- Backend: Firebase or Supabase. (Final choice TBD)
- SMS: Twilio.
- AI Image Analysis: API service (e.g., AWS Rekognition as an example in README). (Final choice TBD)
- Optional Microservice: Python service for haircut frequency prediction.

## 6) Data Overview (High-Level)
- Client: name, phone, haircut history.
- Haircut History: sequence of visits; each visit can include before/after photos and AI analysis results.
- Photos: captured via camera and attached to a visit.
- Bookings: events shown in the integrated calendar (created by app or web).
- Note: Specific field names, formats, and schema are TBD and will align with the chosen backend (Firebase or Supabase) and storage approach (local or backend).

## 7) User Flows (High-Level)
- Create Client: Add client with name and phone, then view/edit profile.
- Capture Visit Photos: From a client profile or visit, open camera, capture before and after photos, save and tag to the visit.
- Analyze Photos: Send captured photos to AI analysis API and store results with the visit.
- Bookings: Create and view bookings in the app; web bookings become visible after sync.
- SMS Reminder: Use predicted return time to schedule and send SMS reminders via Twilio.

## 8) Prototype (Before Coding)
- Create a visual prototype to validate screens and flows before implementation.
  - Include the following screens/flows at minimum: Client List, Client Detail (with history), Add/Edit Client, Photo Capture (before/after), Booking Calendar, Reminder Setup.
  - Provide a clickable flow covering: add client → capture visit photos → view history → schedule reminder → check calendar.

## 9) Milestones (High-Level)
- Prototype complete and reviewed.
- MVP app structure with Client model and list with dummy data.
- Camera integration for before/after capture and basic local storage.
- Backend selection (Firebase or Supabase) and initial data wiring.
- AI analysis integration (basic request/response hooked up to visits).
- Manual SMS reminders wired to Twilio.
- Calendar view with app and web entries visible (sync path defined).

## 10) Risks / Open Questions
- Which backend: Firebase or Supabase?
- Which AI image analysis API?
- Where to persist photos primarily: locally, backend, or both?
- Details of web booking capture/sync path.

## 11) Current Status
- Documentation established: `README.md`, `PRD.md`, and `TODO.md`
- MVP scope locked per PRD; high-level user flows captured in Section 7
- No SwiftUI project created yet; wireframes and clickable prototype are next
""" 