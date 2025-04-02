# Keycloak Boilerplate

A comprehensive, ready-to-use Keycloak setup with social login, custom themes, and production optimizations.

## Features

- **Preconfigured Social Login**: Facebook and Google OAuth integration
- **Custom Theme Support**: Easily customizable themes
- **Docker Compose Setup**: For both development and production
- **Production Optimizations**: Automatic migrations and health checks
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
   docker-compose -f docker-compose.dev.yml up -d
   ```

4. Access Keycloak at http://localhost:8080/auth

### Production Environment

1. Configure your `.env` file with production values

2. Place your SSL certificates in the `certs` directory:
   - `server.crt.pem`: Your SSL certificate
   - `server.key.pem`: Your private key

3. Start the production environment:
   ```bash
   docker-compose -f docker-compose.prod.yml up -d
   ```

## Social Login Configuration

To configure social login providers:

1. Get your client credentials from [Google Cloud Console](https://console.cloud.google.com/) and [Facebook Developers](https://developers.facebook.com/)
2. Add the credentials to your `.env` file
3. Configure the redirect URIs in the provider dashboards to point to:
   - Google: `https://your-keycloak-domain/auth/realms/app-realm/broker/google/endpoint`
   - Facebook: `https://your-keycloak-domain/auth/realms/app-realm/broker/facebook/endpoint`

## Custom Themes

The boilerplate includes a basic custom theme in `themes/custom`. To modify:

1. Edit files in the `themes/custom` directory
2. Restart Keycloak to apply changes
3. Select the custom theme in the Keycloak admin console:
   - Realm Settings > Themes > Login Theme > custom

## Client Integration

The boilerplate creates a default OIDC client called `app-client`. Use these settings in your application:

- **Auth URL**: `https://your-keycloak-domain/auth/realms/app-realm/protocol/openid-connect/auth`
- **Token URL**: `https://your-keycloak-domain/auth/realms/app-realm/protocol/openid-connect/token`
- **Client ID**: `app-client`
- **Client Secret**: Value from your `.env` file

## Health Checks

The production setup includes health checks. You can monitor Keycloak's health at:
- `https://your-keycloak-domain/auth/health/ready`
- `https://your-keycloak-domain/auth/health/live`

## Troubleshooting

- **Database Connection Issues**: Ensure your PostgreSQL container is running and the credentials in `.env` are correct
- **Social Login Problems**: Verify that your client IDs and secrets are correct, and that redirect URIs are properly configured
- **Theme Not Appearing**: Check that the theme directory structure matches Keycloak's requirements and restart the server

