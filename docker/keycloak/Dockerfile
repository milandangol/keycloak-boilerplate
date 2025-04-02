FROM quay.io/keycloak/keycloak:latest

# Add custom themes
COPY themes /opt/keycloak/themes

# Add configuration scripts
COPY config/social-providers.cli /opt/keycloak/

# Switch to root temporarily to change permissions
USER root
COPY docker/keycloak/healthcheck.sh /opt/keycloak/
RUN chmod +x /opt/keycloak/healthcheck.sh
# Switch back to keycloak user
USER keycloak

# Set up automatic migration and optimization for production
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Optimize for production
ENV KC_TRANSACTION_XA_ENABLED=false

# Build optimized distribution for production
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"] 