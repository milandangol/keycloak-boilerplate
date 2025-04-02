<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="form-group">
                            <label for="username" class="control-label">${msg("username")}</label>
                            <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                        </div>

                        <div class="form-group">
                            <label for="password" class="control-label">${msg("password")}</label>
                            <input tabindex="2" id="password" class="form-control" name="password" type="password" autocomplete="off" />
                        </div>

                        <div class="form-group login-options">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                            <div class="">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="form-group">
                            <input tabindex="4" class="btn btn-primary btn-block btn-lg" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </form>
                </#if>
            </div>
            
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="social-providers">
                    <hr/>
                    <h4>${msg("identity-provider-login-label")}</h4>

                    <ul class="list-unstyled">
                        <#list social.providers as p>
                            <li class="social-provider-item">
                                <a href="${p.loginUrl}" id="social-${p.alias}" class="social-button social-${p.alias}">
                                    <#if p.iconClasses?has_content>
                                        <i class="${p.iconClasses!}" aria-hidden="true"></i>
                                    </#if>
                                    ${p.displayName!}
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout> 