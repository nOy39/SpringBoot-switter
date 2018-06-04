<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>


    <form class="form-inline" method="get" action="/main">

        <input type="text" name="filter" class="form-control mr-lg-2" value="${filter?ifExists}" placeholder="Search by Text og Tag">

        <button type="submit" class="btn btn-primary">Search</button>
    </form>


<#include "parts/messageEdit.ftl" />
<#include "parts/messageList.ftl" />
</@c.page>