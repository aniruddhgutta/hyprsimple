---
title: Rake
category: Ruby
layout: 2017/sheet
---

### Basic syntax

```rb
namespace :foo do
  desc "Description"
  task :bar do
    ...
  end

  task :baz => :dependency do
  end

  task :baz => [:dep1, :dep2, :dep3] do
  end
end

# rake foo:bar
```

### Rake task with arguments

```rb
desc "Do something"
task :workit, [:id] => :environment do |_, args|
  id = args[:id]
end

# rake workit[234]
```

https://devhints.io/ cheatsheets - Copyright (c) 2021 Rico Sta. Cruz and contributors - MIT license
micro-cheat plugin Copyright 2022 Tero Karvinen https://TeroKarvinen.com/micro - MIT license
