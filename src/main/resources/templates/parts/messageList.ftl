<#include "security.ftl">
<div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>
            <div class="card-body">
                <i>${message.text}</i>
                <span class="badge badge-primary badge-pill">#${message.tag}</span>
                <div class="card-footer text-muted">
                    <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <#if message.author.id == currentUserId>
                    <a class="btn btn-outline-primary" href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                    </#if>
                </div>
                <div>
                    <a href="/welcome" class="btn btn-outline-secondary ml-3">Details</a>
                    <#if isAdmin>
                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModalCenter">
                            Delete Message
                        </button>
                    </#if>

                    <!-- Modal -->
                    <form action="/main" method="post">
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Message will be deleted. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary my-3" data-dismiss="modal">Close</button>
                                        <a href="/delete/${message.id}" class="btn btn-outline-danger ml-3">Delete message</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>

    </#list>
</div>