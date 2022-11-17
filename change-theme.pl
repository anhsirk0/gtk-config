#! /usr/bin/env perl

my $dir = $ENV{HOME} . "/.config/gtk-3.0";
my $config = $ENV{HOME} . "/.config/gtk-3.0/settings.ini";
my $config_content;
my $gtk_theme = $ARGV[0];
my $icon_theme = $ARGV[1];

if ($theme) {
}

if ($gtk_theme) {
    open(FH, '<' . $config) or die "Unable to open\n";
    while(<FH>) {
	if ($_ =~ /^gtk-theme-name/) {
	    $config_content .= "gtk-theme-name=$gtk_theme\n";
	    next;
	} elsif ($icon_theme && $_ =~ /^gtk-icon-theme-name/) {
	    $config_content .= "gtk-icon-theme-name=$icon_theme\n";
	    next;
	}
	$config_content .= $_;
    }
    open(FH, '>' . $config) or die "Unable to open\n";
    print FH $config_content;
    print "\'$gtk_theme\' gtk-theme selected\n";
    if ($icon_theme) { print "\'$icon_theme\' icon-theme selected\n"; }
} else {
    print "No theme provided\n";
}

