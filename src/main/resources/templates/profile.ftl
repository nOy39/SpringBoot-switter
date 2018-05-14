<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<h5>${username}</h5>
    ${message?ifExists}
<form method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Password :</label>
        <div class="col-sm-6">
            <input class="form-control" type="password" name="password" placeholder="password"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-6">
            <input class="form-control" type="email" name="email" placeholder="some@some.com" value="${email!''}"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-group row">
        <button type="submit" class="btn btn-outline-primary">Save</button>
</div>
</form>
</@c.page>