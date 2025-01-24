# Pizza Assignment App

A Ruby on Rails application for managing pizza orders, complete with user authentication and a responsive UI using Bootstrap. This app is designed for demonstration purposes and includes features like user registration, login, and pizza order management.

## Features

- **User Authentication** using Devise (sign up, login, logout)
- **Order Management** for creating and managing pizza orders
- **Responsive UI** with Bootstrap 5
- **Active Storage** for image handling (e.g., pizza images)
- **Testing** using RSpec, Capybara, and FactoryBot
- **Debugging** with `byebug` and `rails-controller-testing`

## Prerequisites

- **Ruby**: 3.0 or higher
- **Rails**: 8.0.1 or higher
- **Database**: SQLite (for development) or other databases depending on your environment
- **Yarn**: Required for package management of JS assets (optional if not using importmap)

### Installing

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/PoorvaGit01/pizza-assignment.git
   cd pizza-assignment
   ```

2. **Install dependencies**:
   Run the following command to install all required gems listed in the Gemfile:
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies** (if you’re using import maps):
   ```bash
   bin/importmap install
   ```

4. **Set up the database**:
   - Create and migrate the database:
     ```bash
     bin/rails db:create
     bin/rails db:migrate
     ```

   - Optionally, populate the database with sample data (using `db:seed`):
     ```bash
     bin/rails db:seed
     ```

5. **Run the Rails server**:
   Start the Rails development server with the following:
   ```bash
   bin/rails server
   ```
   Open your browser and visit `http://localhost:3000` to view the app.

### Development Setup

- **To run the app in development** mode, simply use `rails server`:
  ```bash
  bin/rails server
  ```

- **To run tests** with RSpec:
  ```bash
  bin/rspec
  ```

- **Debugging**:
  You can use `byebug` within your Rails controllers and models to pause the execution and inspect variables.

### Feature List

- **User Authentication**:
  - Users can sign up and log in to the application using Devise.
  - Support for password reset and account management.

- **Order Management**:
  - Users can create, view, and manage pizza orders.
  - Admins can review orders and manage them.

- **Real-Time Updates**:
  - Use of Hotwire (Turbo & Stimulus) to build SPA-like features for a faster, interactive experience.
  - Changes to the orders page are updated without a full page reload.

- **Bootstrap 5**:
  - The app is fully responsive and uses Bootstrap for a modern, clean UI.

- **Testing**:
  - The app uses RSpec, Capybara, and FactoryBot for unit and integration testing.
  - You can test controllers, models, and system interactions.

### Deployment

If you wish to deploy the application to a production server (such as Heroku or DigitalOcean), ensure that you have the required environment variables set, including the database configuration and any production-specific settings (e.g., `RAILS_ENV=production`).

For Heroku deployment:
- Ensure you have the `pg` gem if you plan to use PostgreSQL in production.
- Set up environment variables (e.g., secret keys) in your hosting service.

---

## Gems Used

- **Devise**: User authentication (sign up, login, etc.)
- **Bootstrap 5**: Front-end framework for responsive UI
- **RSpec and Capybara**: For testing
- **FactoryBot**: For generating test data
- **Faker**: For generating fake data in tests
- **Byebug**: For debugging during development
- **SQLite3**: For the database in development and testing

---

## Troubleshooting

- If you encounter issues with missing gems or dependencies, try running:
  ```bash
  bundle install
  ```

- If you have issues with asset compilation, try:
  ```bash
  bin/rails assets:precompile
  ```

- If your app is running slowly, try using:
  ```bash
  bin/rails tmp:cache:clear
  ```
