#!/bin/bash
# Only alias assh wrapper if assh is installed
is_installed assh && alias ssh='assh wrapper ssh'
