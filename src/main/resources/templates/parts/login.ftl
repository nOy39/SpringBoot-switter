<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">User Name :</label>
        <div class="col-sm-6">
            <input type="text" name="username"
                   class="form-control ${(usernameError??)?string('is-invalid','')}"
                   value="<#if user??>${user.username}</#if>" placeholder="User name"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password :</label>
        <div class="col-sm-6">
            <input class="form-control ${(passwordError??)?string('is-invalid','')}"
                   type="password" name="password" placeholder="password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
    </div>

    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Confirm :</label>
            <div class="col-sm-6">
                <input class="form-control ${(password2Error??)?string('is-invalid','')}"
                       type="password" name="password2" placeholder="Confirm password"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-6">
            <input class="form-control ${(emailError??)?string('is-invalid','')}"
                   type="email" name="email"
                   value="<#if email??>${user.email}</#if>" placeholder="some@some.com"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </div>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-group row">
        <button type="submit" class="btn btn-outline-primary">
            <#if isRegisterForm>Create
            <#else>Sign In
            </#if>
        </button>
    <#if !isRegisterForm>
        <a href="/registration" class="btn btn-outline-secondary ml-3">Registration</a>
    </#if>

    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Log out</button>
</form>
</#macro>