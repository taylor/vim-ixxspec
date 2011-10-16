ixxspec.vim
============

Quick and dirty rspec integration with vim.  Yes there are many choices out
there and most have many more features... including some that you may want like
jumping to the first error in your source code.   I did not want any of that.

I wanted to run rspec in 4 simple ways and preferred to have it run in a tmux (or screen) window below my code.
If you have used Slime, then this plugin should feel comfortable.  

You can check out  [2007 Slime.vim blog
entry](http://technotales.wordpress.com/2007/10/03/like-slime-for-vim/) or the
new version on github as [vim-slime](https://github.com/jpalardy/vim-slime) for
more information on Slime.vim.

The four scenarios supported for running tests are:

 1. Run all tests
 1. Run tests the currently viewed spec file
 1. Run rspec on the last spec file tested -- good for when you are not looking at that spec file
 1. Run rspec for a block in a spec file (current) -- focused test by line number you are on

You can run those spec scenarios with:

 1. `:Spec`
 1. `:SpecThis`
 1. `:SpecLast`
 1. `:SpecBlock`


For faster interaction you may want to create some mappings.  Feel free to run
`:IxxSpecDefaultMaps` to get the mapping I suggest, which are:

    map <leader>SS :Spec<cr>
    map <leader>ST :SpecThis<cr>
    map <leader>SL :SpecLast<cr>
    map <leader>SB :SpecBlock<cr>

My leader is set to `\` so that would be \ST to run rspec on the currently
viewed spec file.

All of this will run with out a tmux/screen, but it will just show the
information like any other :! command below the status bar.

If you want the output in a vim split window you may be happier with a
different plugin... not sure if this one will ever add that functionality since
I prefer the tmux/screen window split.  It would be nice to see rspec executing
in no tmux/screen mode...

Installation
------------

If you don't have a preferred installation method, I recommend installing
[pathogen.vim](https://github.com/tpope/vim-pathogen) from Tim Pope, and then
simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/taylor/vim-ixxspec.git

Contributing
------------

`Tim sum's up my thoughts on contributing to vim plugins very well so I'll just copy his here ;)`

Before reporting a bug, you should try stripping down your Vim
configuration and removing other plugins.  The sad nature of VimScript
is that it is fraught with incompatibilities waiting to happen.  I'm
happy to work around them where I can, but it's up to you to isolate
the conflict.

If your [commit message sucks](http://stopwritingramblingcommitmessages.com/),
I'm not going to accept your pull request.

I've explained very politely dozens of times that [my general
guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
are absolute rules on my own repositories, so I may lack the energy to explain
it to you yet another time.  And please, if I ask you to change something, `git
commit --amend`.

Beyond that, don't be shy about asking before patching.  What takes you
hours might take me minutes simply because I have both domain knowledge
and a perverse knowledge of VimScript so vast that many would consider
it a symptom of mental illness.  On the flip side, some ideas I'll
reject no matter how good the implementation is.  "Send a patch" is an
edge case answer in my book.

Self-Promotion
--------------

Like ixxspec.vim? Follow the repository on
[GitHub](https://github.com/taylor/vim-ixxspec)
or me via [Twitter](http://twitter.com/ixx) and
[GitHub](https://github.com/taylor).

License
-------

Copyright (c) Taylor Carpenter.  Distributed under the same terms as Vim itself.
See `:help license`.
