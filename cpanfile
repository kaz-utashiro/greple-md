requires 'perl', '5.024';

requires 'App::Greple', '10.04';
requires 'Getopt::EX::Config', '1.0202';
requires 'URI::Escape';
requires 'Command::Run';
requires 'App::ansicolumn';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

