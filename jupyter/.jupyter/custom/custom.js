Jupyter.notebook.set_autosave_interval(0);

require([
  'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
  // Map jj to <Esc>
  CodeMirror.Vim.map("jj", "<Esc>", "insert");
});

require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Indicate the key combination to run the commands
    km.edit_shortcuts.add_shortcut('ctrl-s', 'jupyter-notebook:save-notebook', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});

// require([
//   'nbextensions/vim_binding/vim_binding',
//   'base/js/namespace',
// ], function(vim_binding, ns) {
//   // Add post callback
//   vim_binding.on_ready_callbacks.push(function(){
//     var km = ns.keyboard_manager;
//     // Indicate the key combination to run the commands
//     // km.edit_shortcuts.add_shortcut('alt-p', 'jupyter-notebook:save-notebook', true);
//     km.edit_shortcuts.add_shortcut('ctrl-shift-p', 'jupyter-notebook:show-command-palette');
//     // Update Help
//     km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
//   });
// });
//
// // jupyter-notebook:show-command-palette
