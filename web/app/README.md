A user-facing web surface built on nextjs, hooked into the Bazel build system.

There are some small bugs remaining with Gazelle, which ideally generates and updates the BUILD files - it is rewriting BUILD dependencies for the subpackages (.../pages, .../public, etc) from depending on the globally shared node_modules installations (//:node_modules/react) to a local one (//web/app:node_modules/react), which does not exist.
