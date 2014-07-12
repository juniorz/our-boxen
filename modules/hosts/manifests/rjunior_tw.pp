# Host stuff

class hosts::rjunior_tw {
  include ruby
  include projects::all

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  ruby::local { '/Users/king/src/my-book/comments-service':
    version => '2.1.2'
  }
}
