<#-- @ftlvariable name="contentUrl" type="java.lang.String" -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ktor-htmx-sample</title>
        <script src="/static/vendor/htmx.min.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Ktor htmx sample</h1>
        <p>If this text is still here, the layout surrounds the content</p>
        <div id="root"
             hx-target="#content"
             hx-history-elt="#content"
             hx-push-url="true"
             hx-swap="innerHtml"
             hx-trigger="load"
             hx-get="${contentUrl}"
        >
            <div id="content"></div>
        </div>
    </body>
</html>