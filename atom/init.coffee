#
# Init
#   Atom will evaluate this file each time a new window is opened. It is run
#   after packages are loaded/activated and after the previous editor state
#   has been restored.
#


#bare opens of atom.app should bring up the file tree
#if not atom.project.getPath()
try
    # Forcing Tree View to always appear
    # https://github.com/atom/tree-view/issues/68
    if not atom.project.getPath()
      atom.project.setPath(atom.config.get('core.projectHome'))
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'tree-view:show')
catch e
    console.log e.stack