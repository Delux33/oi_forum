<#import "parts/common.ftlh" as c>
<#import "parts/textArticle.ftlh" as t>
<#include "parts/security.ftlh" />

<@c.page>
    <div class="row mb-3">
        <div class="col">
            <a href="/topics/${id_message}">
                <span class="lnr lnr-arrow-left"></span>
            </a>
        </div>
        <div class="col" align="right">
            <#if article.textArticle??>
                <#if isOwnerArticle || isAdmin || isModerator>
                    <a href="/topics/${id_message}/${article.id}/article">
                        <span class="lnr lnr-pencil mr-2"></span>
                    </a>
                </#if>
            </#if>
        </div>
    </div>
    <#if !article.textArticle??>
        <#if isOwnerArticle>
            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button"
               aria-expanded="false"
               aria-controls="collapseExample">
                Написать статью
            </a>
            <div class="collapse <#if textArticleError??>show</#if>" id="collapseExample">
                <div class="form-group">
                    <form method="post" action="/topics/${id_message}/${article.id}" enctype="multipart/form-data">
                        <div class="form-floating mt-3">
                    <textarea class="form-control ${(textArticleError??)?string('is-invalid', '')}" type="text"
                              name="textArticle"
                              placeholder="Напиши сюда текст для своей статьи" id="floatingTextarea2"
                              style="height: 100px"></textarea>
                            <#if textArticleError??>
                                <div class="invalid-feedback">
                                    ${textArticleError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group mt-3">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </div>
                    </form>
                </div>
            </div>
        </#if>
    </#if>
    <@t.textArticle />
    <#if article.textArticle??>
        <#list comments as comment>
            <div class="card mb-3">
                <div class="card-body">
                    <#if isAdmin>
                        <form method="post" align="right"
                              action="/topics/${id_message}/${article.id}/delete/${comment.id}">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-outline-danger btn-sm">X</button>
                        </form>
                    </#if>
                    <h6 class="card-subtitle mb-2 text-muted">${comment.author.username}</h6>
                    <p class="card-text">${comment.comment}</p>
                    <p class="card-text" align="right">${comment.time}</p>
                </div>
            </div>
                <div class="card-body">
                    <#if comment.answeredComment>
                        <h6 class="card-subtitle mb-2 text-muted">User: ${comment.author.username}</h6>
                        <h6 class="card-subtitle mb-2 text-muted">Comment: ${comment.comment}</h6>
                        <h6 class="card-subtitle mb-2 text-muted">Comment time: ${comment.time}</h6>
                        <hr>
                        <#if isAdmin>
                            <form method="post" align="right"
                                  action="/topics/${id_message}/${article.id}/delete/answer/${comment.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-outline-danger btn-sm">X</button>
                            </form>
                        </#if>
                        <h6 class="card-subtitle mb-2 text-muted">answer from Bot</h6>
                        <p class="card-text">${comment.answer}</p>
                        <p class="card-text" align="right">${comment.answerTime}</p>
                    </#if>
                </div>
        <#else>
            <div align="center">Комментарии отсутствуют, можешь добавить свой</div>
        </#list>
        <div class="form-group mt-3">
            <form method="post" action="/topics/${id_message}/${article.id}/comment" enctype="multipart/form-data">
                <div class="form-group <#if commentError??>show</#if>">
            <textarea class="form-control ${(commentError??)?string('is-invalid', '')}" type="comment" name="comment"
                      placeholder="Напиши сюда свой комментарий"
                      id="floatingTextarea2" style="height: 100px"></textarea>
                    <#if commentError??>
                        <div class="invalid-feedback">
                            ${commentError}
                        </div>
                    </#if>
                    <div class="mt-3">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </div>
            </form>
        </div>
    </#if>
</@c.page>