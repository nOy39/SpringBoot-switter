<#import "parts/common.ftl" as c>
<@c.page>

    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Username</th>
            <th scope="col">Role</th>
            <th scope="col">Manage</th>
        </tr>
        </thead>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/users/${user.id}">Edit</a>
        <a href="/users/delete/${user.id}">Delete</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>