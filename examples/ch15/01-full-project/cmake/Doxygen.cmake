find_package(Doxygen REQUIRED)

include(FetchContent)
FetchContent_Declare(doxygen-awesome-css
  GIT_REPOSITORY
    https://github.com/jothepro/doxygen-awesome-css.git
  GIT_TAG
    v2.3.1
)
FetchContent_MakeAvailable(doxygen-awesome-css)

function(Doxygen target input)
  set(NAME "doxygen-${target}")
  set(DOXYGEN_GENERATE_HTML YES)
  set(DOXYGEN_HTML_OUTPUT   ${PROJECT_BINARY_DIR}/${output})

  UseDoxygenAwesomeCss()
  UseDoxygenAwesomeExtensions()

  doxygen_add_docs("doxygen-${target}"
      ${PROJECT_SOURCE_DIR}/${input}
      COMMENT "Generate HTML documentation"
  )
endfunction()

macro(UseDoxygenAwesomeCss)

  set(DOXYGEN_GENERATE_TREEVIEW     YES)
  set(DOXYGEN_HAVE_DOT              YES)
  set(DOXYGEN_DOT_IMAGE_FORMAT      svg)
  set(DOXYGEN_DOT_TRANSPARENT       YES)
  set(DOXYGEN_HTML_EXTRA_STYLESHEET
      ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome.css)
endmacro()

macro(UseDoxygenAwesomeExtensions)
  set(DOXYGEN_HTML_EXTRA_FILES
    ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-darkmode-toggle.js
    ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-fragment-copy-button.js
    ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-paragraph-link.js
    ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome-interactive-toc.js
  )

  execute_process(COMMAND doxygen -w html header.html footer.html style.css
                  WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
  execute_process(COMMAND sed -i "/<\\/head>/r ${PROJECT_SOURCE_DIR}/cmake/doxygen_extra_headers" header.html
                  WORKING_DIRECTORY ${PROJECT_BINARY_DIR})
  set(DOXYGEN_HTML_HEADER ${PROJECT_BINARY_DIR}/header.html)
endmacro()
