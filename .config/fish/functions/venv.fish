function venv
    if not test -d .venv
        python3 -m venv .venv
    end
    source .venv/bin/activate.fish
end
