<#-- @ftlvariable name="contentUrl" type="java.lang.String" -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ktor-htmx-sample</title>
        <script src="/static/vendor/htmx.min.js" type="text/javascript"></script>
    </head>
    <body>
        <header>
            <nav>
                <ul hx-push-url="true"
                    hx-target="#content"
                >
                    <li><a href="#" hx-get="/">Home</a></li>
                    <li><a href="#" hx-get="/about">About</a></li>
                    <li><a href="#" hx-get="/contact">Contact</a></li>
                </ul>
            </nav>
        </header>
        <div id="root"
             hx-target="#content"
             hx-swap="innerHtml"
             hx-trigger="load"
             hx-get="${contentUrl}"
        >
            <div id="content" hx-history-elt></div>
        </div>
    </body>
</html>