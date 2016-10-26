#!/usr/local/bin/perl
# Mike McQuade
# fibd.pl
# Calculates the Fibonnacci number of rabbits if each
# one that is born dies after a given number of months.

use strict;
use warnings;

# Initialize the variables
my (@tempArr,$numMonth,$lifeSpan);

# Open the file to read
open(my $fh,"<fibd.txt") or die $!;

# Read in the two integers from the file
@tempArr = split /\s/, <$fh>;
$numMonth = $tempArr[0];
$lifeSpan = $tempArr[1];

# Call the recursive function with the two integers
print rabbits($numMonth,$lifeSpan,0);

# Close the file
close($fh) || die "Couldn't close file properly";

# Calculates the number of rabbits in a given month,
# taking the life span of the rabbits into account.
sub rabbits {
	# Define local variables
    my $n = $_[0];
    my $m = $_[1];
    
    # Base cases
    if ($n == 0 or $n == 1) {return $n}
    
    # Recursive functions
    if ($n <= $m) { # No rabbits have died yet
        return rabbits($n-1,$m) + rabbits($n-2,$m);
    } elsif ($n == $m+1) { # The first rabbit has died, so we subtract 1 from the answer
    	return rabbits($n-1,$m) + rabbits($n-2,$m) - 1;
    } else { # Recursively find each additional generation of deaths and subtract from answer
    	return rabbits($n-1,$m) + rabbits($n-2,$m) - rabbits($n-($m+1),$m)
    }
}