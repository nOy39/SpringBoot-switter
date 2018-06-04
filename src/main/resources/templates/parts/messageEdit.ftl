<div class="form-group">
    <a class="btn btn-primary mt-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Message
    </a>

    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group my-3">
            <form method="post" action="/main" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid','')}"
                           value="<#if message??>${message.text}</#if>" placeholder="Input message"/>
                        <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                        </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control"
                           value="<#if message??>${message.tag}</#if>" name="tag" placeholder="#tag">
                        <#if tagError??>
                           <div class="invalid-feedback">
                               ${tagError}
                           </div>
                        </#if>
                </div>
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choice file</label>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
                <button class="btn btn-primary mt-3" type="submit">Add message</button>
            </form>
        </div>
    </div>
</div>