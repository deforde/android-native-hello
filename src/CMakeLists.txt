file(GLOB SOURCES *.c)

target_sources(hello
PRIVATE
    ${SOURCES}
)
