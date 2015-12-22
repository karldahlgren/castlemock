<%@ include file="../../../includes.jspf"%>
<div class="content-top">
    <h1><spring:message code="general.eventoverview.header.log"/></h1>
</div>
<div class="table-frame">
    <table class="entityTable">
        <col width="10%">
        <col width="30%">
        <col width="10%">
        <col width="25%">
        <col width="25%">
        <tr>
            <th><spring:message code="general.eventoverview.column.id"/></th>
            <th><spring:message code="general.eventoverview.column.resourcename"/></th>
            <th><spring:message code="general.eventoverview.column.type"/></th>
            <th><spring:message code="general.eventoverview.column.startdate"/></th>
            <th><spring:message code="general.eventoverview.column.enddate"/></th>
        </tr>
        <c:forEach items="${events}" var="event" varStatus="loopStatus">
            <tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
                <td><a href="<c:url value="/web/${event.typeIdentifier.typeUrl}/event/${event.id}"/>">${event.id}</a></td>
                <td><a href="<c:url value="${event.resourceLink}"/>">${event.resourceName}</a></td>
                <td><a href="<c:url value="/web/${event.typeIdentifier.typeUrl}/event/${event.id}"/>">${event.typeIdentifier.type}</a></td>
                <td><a href="<c:url value="/web/${event.typeIdentifier.typeUrl}/event/${event.id}"/>">${event.startDate}</a></td>
                <td><a href="<c:url value="/web/${event.typeIdentifier.typeUrl}/event/${event.id}"/>">${event.endDate}</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
