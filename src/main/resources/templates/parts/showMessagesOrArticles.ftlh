<#macro show path isTopic>
    <#include "security.ftlh" />
    <#if isTopic>
        <div class="shadow-lg p-3 mb-5 bg-body rounded mt-3">
            <#list messages as message>
                <div class="shadow-lg bg-body rounded mt-2">
                    <div class="bg-light border">
                        <div class="row ml-2 align-items-center">
                            <a href="${path}/${message.id}">${message.text}</a>
                            <div class="col" align="right">
                                <span class="mr-2">${message.time}</span>
                                <#if (message.author.id == currentUserId) || isAdmin || isModerator>
                                    <form method="post" action="${path}/delete/${message.id}">
                                        <a href="${path}/edit/${message.id}">
                                            <span class="lnr lnr-pencil mr-2"></span>
                                        </a>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-outline-danger btn-sm">X</button>
                                    </form>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <div align="center">Темы отсутствуют, ждем когда их добавят</div>
            </#list>
        </div>
    <#else>
        <div class="shadow-lg p-3 mb-5 bg-body rounded mt-3">
            <#list articleTitle as article>
                <div class="shadow-lg bg-body rounded mt-3">
                    <div class="bg-light border">
                        <div class="row ml-2 align-items-center">
                            <a href="${path}/${article.id}">${article.title}</a>
                            <div class="col" align="right">
                                <span class="mr-2">${article.time}</span>
                                <#if (article.author.id == currentUserId) || isAdmin || isModerator>
                                    <form method="post" action="${path}/delete/${article.id}">
                                        <a href="${path}/edit/${article.id}">
                                            <span class="lnr lnr-pencil mr-2"></span>
                                        </a>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-outline-danger btn-sm">X</button>
                                    </form>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            <#else>
                <div align="center">Добавь заголовок для своей статьи</div>
            </#list>
        </div>
    </#if>
</#macro>