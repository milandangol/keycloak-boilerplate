# Keycloak Boilerplate

A comprehensive, ready-to-use Keycloak setup with social login, custom themes, and modern UI.

## Features

- **Preconfigured Social Login**: Facebook and Google OAuth integration
- **Modern Custom Theme**: Clean, responsive design with gradient accents
- **Docker Compose Setup**: Easy development environment
- **Developer-Friendly**: Minimal configuration required

## Quick Start

### Development Environment

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Update the `.env` file with your configuration

3. Start the development environment:
   ```bash
   docker-compose -f docker-compose.dev.yml up -d -build
   ```

4. Access Keycloak at http://localhost:8080/auth

## Directory Structure

```
├── config/                  # Keycloak configuration
│   └── ...                  # Realm and client configurations
├── docker/                  # Docker related files
│   └── ...                  # Docker custom scripts and configuration
├── themes/                  # Keycloak themes
│   └── custom/              # Custom theme
│       ├── account/         # Account management theme
│       ├── common/          # Shared resources
│       └── login/           # Login theme
│           ├── resources/   # Static resources
│           │   ├── css/     # CSS files
│           │   ├── img/     # Images
│           │   └── js/      # JavaScript files
│           ├── template/    # Template parts
│           ├── login.ftl    # Main login template
│           ├── template.ftl # Base template
│           └── theme.properties # Theme configuration
├── .env.example             # Example environment variables
└── docker-compose.dev.yml   # Docker compose for development
```

## Social Login Configuration

To configure social login providers:

1. Get your client credentials from [Google Cloud Console](https://console.cloud.google.com/) and [Facebook Developers](https://developers.facebook.com/)
2. Add the credentials to your `.env` file
3. Configure the redirect URIs in the provider dashboards to point to:
   - Google: `http://localhost:8080/auth/realms/app-realm/broker/google/endpoint`
   - Facebook: `http://localhost:8080/auth/realms/app-realm/broker/facebook/endpoint`

## Custom Theme

The boilerplate includes a modern custom theme in `themes/custom`. The theme features:

- Clean, modern design with gradient accents
- Responsive layout for all device sizes
- Improved form field styling with icons
- Support for social login buttons
- Custom SVG logo

To modify the theme:

1. Edit files in the `themes/custom` directory:
   - `login.ftl` - The login page template
   - `resources/css/login.css` - Styling
   - `resources/img/logo.svg` - Logo image

2. Restart Keycloak to apply changes:
   ```bash
   docker-compose -f docker-compose.dev.yml restart keycloak
   ```

3. Select the custom theme in the Keycloak admin console:
   - Realm Settings > Themes > Login Theme > custom

## Client Integration

The boilerplate creates a default OIDC client called `app-client`. Use these settings in your application:

- **Auth URL**: `http://localhost:8080/auth/realms/app-realm/protocol/openid-connect/auth`
- **Token URL**: `http://localhost:8080/auth/realms/app-realm/protocol/openid-connect/token`
- **Client ID**: `app-client`
- **Client Secret**: Value from your `.env` file

## Troubleshooting

- **Database Connection Issues**: Ensure your PostgreSQL container is running and the credentials in `.env` are correct
- **Social Login Problems**: Verify that your client IDs and secrets are correct, and that redirect URIs are properly configured
- **Theme Not Appearing**: Check that the theme directory structure matches Keycloak's requirements and restart the server

## Useful Commands

### Docker Commands

```bash
# Check running containers
docker ps

# Check container logs
docker logs <container_id>

# Enter Keycloak container shell
docker exec -it <container_id> bash

# Restart Keycloak
docker-compose -f docker-compose.dev.yml restart keycloak

# Stop all containers
docker-compose -f docker-compose.dev.yml down

# Remove volumes when stopping (resets database)
docker-compose -f docker-compose.dev.yml down -v

#Reinitialize the environment
docker-compose -f docker-compose.dev.yml down -v && docker-compose -f docker-compose.dev.yml up -d --build
```

