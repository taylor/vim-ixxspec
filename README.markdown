ixxspec.vim
============

Quick and dirty rspec integration with vim.  Yes there are many choices out
there and most have many more features... including some that you may want like
jumping to the first error in your source code.   I did not want any of that.
I wanted to run rspec in 4 simple ways, and have that run in a tmux (or screen)
pane/region below my code pane.

 1. Run rspec spec for all tests
 1. Run rspec on an indivual spec file
 1. Run rspec on the last spec file tested -- good for when you are not looking at that spec file
 1. Run rspec for a block in a spec file (really just runs based on line number)


You can run those spec scenarios with:

 1. `:Spec`
 1. `:SpecThis`
 1. `:SpecLast`
 1. `:SpecBlock`

You may also want to create some maps for faster interaction.  You can run
`:IxxSpecDefaultMaps` to get the mapping I suggest:

    map <leader>SS :Spec<cr>
    map <leader>ST :SpecThis<cr>
    map <leader>SL :SpecLast<cr>
    map <leader>SB :SpecBlock<cr>

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
