<#import "parts/common.ftl" as c>

<@c.page>


    <form class="form-inline" method="get" action="/main">

            <input type="text" name="filter" class="form-control mr-lg-2" value="${filter?ifExists}" placeholder="Search by Text og Tag">

        <button type="submit" class="btn btn-primary">Search</button>
    </form>


    <div class="form-group">
        <a class="btn btn-primary mt-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new Message
        </a>

        <div class="collapse" id="collapseExample">
            <div class="form-group my-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" name="text" class="form-control" placeholder="Input message"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="tag" class="form-control" placeholder="#tag">
                    </div>
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choice file</label>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary mt-3" type="submit">Add message</button>
                </form>
            </div>
        </div>
    </div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <div class="card-body">
            <i>${message.text}</i>
            <span class="badge badge-primary badge-pill">${message.tag}</span>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
            <div>
                <a href="/welcome" class="btn btn-outline-secondary ml-3">Подробнее</a>
            </div>
        </div>
    </div>

    </#list>
</div>
</@c.page>