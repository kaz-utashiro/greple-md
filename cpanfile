requires 'perl', '5.024';

requires 'App::Greple', '10.03';
requires 'Getopt::EX::Config', '1.0202';
requires 'URI::Escape';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

