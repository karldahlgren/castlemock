<%@ include file="../../../../includes.jspf"%>
<%--
  ~ Copyright 2015 Karl Dahlgren
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~   http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>

<c:url var="create_rest_mock_response_url"  value="/web/rest/project/${restProjectId}/application/${restApplicationId}/resource/${restResourceId}/method/${restMethodId}/create/response" />
<div class="navigation">
    <ol class="breadcrumb">
        <li><a href="${context}/web"><spring:message code="general.breadcrumb.home"/></a></li>
        <li><a href="${context}/web/rest/project/${restProjectId}"><spring:message code="rest.breadcrumb.project"/></a></li>
        <li><a href="${context}/web/rest/project/${restProjectId}/application/${restApplicationId}"><spring:message code="rest.breadcrumb.application"/></a></li>
        <li><a href="${context}/web/rest/project/${restProjectId}/application/${restApplicationId}/resource/${restResourceId}"><spring:message code="rest.breadcrumb.resource"/></a></li>
        <li><a href="${context}/web/rest/project/${restProjectId}/application/${restApplicationId}/resource/${restResourceId}/method/${restMethodId}"><spring:message code="rest.breadcrumb.method"/></a></li>
        <li class="active"><spring:message code="rest.createrestmockresponse.header.createmockresponse"/></li>
    </ol>
</div>
<div class="container">
    <section>
        <div class="content-top">
            <h1><spring:message code="rest.createrestmockresponse.header.createmockresponse"/></h1>
        </div>
        <form:form action="${create_rest_mock_response_url}" method="POST" modelAttribute="restMockResponse">
            <div class="content-summary">
                <table class="formTable">
                    <tr>
                        <td class="column1"><form:label path="name"><spring:message code="rest.createrestmockresponse.label.name"/></form:label></td>
                        <td class="column2"><form:input class="form-control" path="name" id="restMockResponseNameInput" /></td>
                    </tr>
                    <tr>
                        <td class="column1"><form:label path="httpStatusCode"><spring:message code="rest.createrestmockresponse.label.httpstatuscode"/></form:label></td>
                        <td class="column2"><form:input class="form-control" path="httpStatusCode" id="restMockResponseHttpResponseCodeInput" /></td>
                        <td><label id="httpCodeDefinitionLabel"><spring:message code="soap.createrestmockresponse.label.httpstatuscodedefinition"/>:&nbsp;</label><label id="httpCodeLabel"></label></td>
                    </tr>
                    <tr>
                        <td class="column1"><form:label path="status"><spring:message code="rest.createrestmockresponse.label.status"/></form:label></td>
                        <td>
                            <form:select class="form-control" path="status">
                                <c:forEach items="${restMockResponseStatuses}" var="restMockResponseStatus">
                                    <spring:message var="label" code="rest.type.restmockresponsestatus.${restMockResponseStatus}"/>
                                    <form:option value="${restMockResponseStatus}" label="${label}"/>
                                </c:forEach>
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td class="column1"><form:label path="usingExpressions"><spring:message code="rest.createrestmockresponse.label.useexpressions"/></form:label></td>
                        <td class="column2"><span class="checkbox"><form:checkbox class="form-control" path="usingExpressions"/></span></td>
                    </tr>
                </table>
            </div>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-body"><spring:message code="rest.createrestmockresponse.header.body"/></a></li>
                <li><a data-toggle="tab" href="#tab-headers"><spring:message code="rest.createrestmockresponse.header.headers"/></a></li>
            </ul>

            <div class="tab-content">
                <div id="tab-body" class="tab-pane fade in active">
                    <div>
                        <h2 class="decorated"><span><spring:message code="rest.createrestmockresponse.header.body"/></span></h2>
                        <div class="editor">
                            <form:textarea id="body" path="body"/>
                            <div class="editorButtons">
                                <button id="formatXmlButton" type="button"><spring:message code="rest.createrestmockresponse.button.formatxml"/></button>
                                <button id="formatJsonButton" type="button"><spring:message code="rest.createrestmockresponse.button.formatjson"/></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-headers" class="tab-pane fade">
                    <h2 class="decorated"><span><spring:message code="rest.createrestmockresponse.header.headers"/></span></h2>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><spring:message code="rest.createrestmockresponse.field.addheader"/></h3>
                        </div>
                        <div class="panel-body">
                            <table class="formTable">
                                <tr>
                                    <td class="column1"><form:label path="name"><spring:message code="rest.createrestmockresponse.label.headername"/></form:label></td>
                                    <td class="column2"><input type="text" class="form-control" name="headerName" id="headerNameInput"></td>
                                </tr>
                                <tr>
                                    <td class="column1"><form:label path="name"><spring:message code="rest.createrestmockresponse.label.headervalue"/></form:label></td>
                                    <td class="column2"><input type="text" class="form-control" name="headerValue" id="headerValueInput"></td>
                                </tr>
                            </table>
                            <button class="btn btn-success" onclick="addHeader()" type="button"><i class="fas fa-plus-circle"></i>  <span><spring:message code="rest.createrestmockresponse.button.addheader"/></span></button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover sortable" id="headerTable">
                            <col width="4%">
                            <col width="48%">
                            <col width="48%">
                            <tr>
                                <th></th>
                                <th><spring:message code="rest.createrestmockresponse.column.headername"/></th>
                                <th><spring:message code="rest.createrestmockresponse.column.headervalue"/></th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <sec:authorize access="hasAuthority('ADMIN') or hasAuthority('MODIFIER')">
                <button class="btn btn-success" type="submit" name="submit"><i class="fas fa-plus-circle"></i>  <span><spring:message code="rest.createrestmockresponse.button.createmockresponse"/></span></button>
            </sec:authorize>
            <a href="<c:url value="/web/rest/project/${restProjectId}/application/${restApplicationId}/resource/${restResourceId}/method/${restMethodId}"/>" class="btn btn-danger"><i class="fas fa-times"></i> <span><spring:message code="rest.createrestmockresponse.button.cancel"/></span></a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
    </section>
</div>
<script src=<c:url value="/resources/js/headerTable.js"/>></script>
<script src=<c:url value="/resources/js/editor.js"/>></script>
<script>
    $("#restMockResponseNameInput").attr('required', '');
    $("#restMockResponseHttpResponseCodeInput").attr('required', '');
    $("#restMockResponseHttpContentTypeInput").attr('required', '');
    enableTab('body');
    initiateHttpResponseCode('restMockResponseHttpResponseCodeInput','httpCodeLabel', 'httpCodeDefinitionLabel');
    registerXmlFormat('formatXmlButton','body');
    registerJsonFormat('formatJsonButton','body');
</script>
