sudo dnf install -y fish
sudo dnf install -y util-linux-user
chsh -s /bin/fish
rm ~/.config/fish/config.fish
echo -e '#Edited by Tahinli\nif status is-interactive\n\t# Commands to run in interactive sessions can go here\n\tfunction fish_greeting\n\t\techo Hello Tahinli\n\tend\nend' | tee ~/.config/fish/config.fish
