local Terminal = require('toggleterm.terminal').Terminal
local cargo_buildbot_test = Terminal::new({ cmd = "cargo test --verbose --locked --features runtime-benchmarks", hidden = true})
local cargo_buildbot_benchmark = Terminal::new({ cmd = "cargo build --release --locked --features runtime-benchmarks -p efinity", hidden = true })
local cargo_buildbot_clippy = Terminal::new({ cmd = "cargo clippy --all-targets --workspace --features runtime-benchmarks -- --deny warnings", hidden = true })


function _spawn_cargo_test()
  cargo_buildbot_test:spawn()
end

function _spawn_cargo_benchmark()
  cargo_buildbot_benchmark:spawn()
end

function _spawn_cargo_clippy()
  cargo_buildbot_clippy:spawn()
end
