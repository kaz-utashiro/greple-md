requires 'perl', '5.024';

requires 'App::Greple', '9.23';
requires 'Getopt::EX::Config';
requires 'URI::Escape';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

