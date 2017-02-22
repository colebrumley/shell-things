#!/usr/bin/env bats

@test "add_to_path adds a new dir correctly" {
  add_to_path /tmp/testbin
  [[ $PATH =~ ^/tmp/testbin: ]]
}

@test "err directs output to stderr" {
  local stdoutPath="${BATS_TMPDIR}/${BATS_TEST_NAME}.stdout"
  local stderrPath="${BATS_TMPDIR}/${BATS_TEST_NAME}.stderr"

  err testtest123 1>${stdoutPath} 2>${stderrPath}

  ! grep "testtest123"  ${stdoutPath}
  grep "testtest123" ${stderrPath}
}

@test "err_out exits 1" {
  run err_out ohnoes
  [ "$status" -eq 1 ]
}

@test "is_installed finds executables that are installed" {
  is_installed bash
}

@test "is_installed does not find executables that are not installed" {
  run is_installed asdfoqwbhfsk
  [ "$status" -eq 1 ]
}