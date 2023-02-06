package com.example.plugins

import io.ktor.server.routing.*
import io.ktor.server.response.*
import io.ktor.server.http.content.*
import io.ktor.server.application.*
import io.ktor.server.freemarker.FreeMarkerContent
import io.ktor.server.request.header
import io.ktor.server.request.uri

private const val STATIC_PATH = "/static"

fun Application.configureRouting() {
    routing {

        static(STATIC_PATH) {
            resources("static")
        }

        intercept(ApplicationCallPipeline.Call) {
            call.application.environment.log.info("Intercepting request to uri: ${call.request.uri} HX-Request=${call.request.header("HX-Request")}")

            val isHxRequest = call.request.header("HX-Request") == "true"
            val isStaticRequest = call.request.uri.contains(STATIC_PATH)
            if (
                !isHxRequest &&
                !isStaticRequest
            ) {
                call.respond(FreeMarkerContent("layout.ftl", mapOf("contentUrl" to call.request.uri)))
            }
        }

        get("/") {
            call.respond(FreeMarkerContent("index.ftl", null))
        }

        get("/about") {
            call.respond(FreeMarkerContent("about.ftl", null))
        }
    }
}
