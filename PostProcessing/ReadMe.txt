For the calculated cross slope and running slope values, the first 600 samples are used to converge to true value because PathMeT is always accelerating at the beginning. So slope values are not accurate at the beginning.

In rare cases where PathMeT is pulled backwards,  PathMeT stops measuring but time is still going forward. Therefore, dt between two samples will be very big. Consequently both pitch and roll are integrated using wrong dt. Pitch and Roll can go over 90 degrees depending on how long before PathMeT goes forward again.

This case only happens when there was a tree branch blocking PathMeT's way and we accidentally pulled it backwards. Usually we either stopped and started a new run. 