# Audio-Matching-via-Search-Algorithm

Imagine that, you’re in your car, listening to the radio and suddenly you hear a song that catches your attention. It’s the best new song you have heard for a long time, but you missed the announcement and don’t recognize the artist. Still, you would like to know more about this music. If you can record the song, you can find its name thanks to our engine.

What about mixes? You have heard a song that is created as a mix of several songs and you want to know that which songs are mixed. Our search engine can find those songs in several seconds.

Audio Matching Problem:

Audio matching is often regarded as identification problems where an unknown audio segment is matched to a large audio database.

In principle, the problem can be approached using deterministic methods such as correlation and template matching. However there are also certain limitations. First of all, the computational cost in these methods is quite high in audio applications.

Way to reduce computational complexity and the number of data is working on a feature space instead of working directly on audio data.

A source of difficulty when automatically identifying audio content derives from its high dimensionality, the significant variance of the audio data for perceptually similar content and the necessity to efficiently compare the fingerprint with a huge collection of registered fingerprints.

Audio Fingerprint:

An audio fingerprint is a compact content-based signature that summarizes an audio recording.

Audio fingerprinting extract characteristics of a piece of audio content and store them in a database. When presented with an unidentified piece of audio content, characteristics of that piece are calculated and matched against those stored in the database. 

Using fingerprints and matching algorithms, distorted versions of a single recording can be identified as the same music title. 

Content-based audio identification framework:

![image](https://user-images.githubusercontent.com/79766032/114278136-50b85c80-99fc-11eb-96cf-d4356cabccd8.png)

Fingerprint Extraction:

The fingerprint extraction derives a set of relevant perceptual characteristics of a recording in a concise and robust form.

![image](https://user-images.githubusercontent.com/79766032/114278147-6299ff80-99fc-11eb-8503-ad86962664bf.png)

Wang’s Algorithm for Fingerprint Extraction:

In order to address the problem of robust identification in the presence of highly significant noise and distortion, we settled on spectrogram peaks.  A time-frequency point is a candidate peak if it has a higher energy content than all its neighbors in a region centered around the point.  Then we find a map consists of dots. We call it constellation maps. It is a powerful way of matching in the presence of noise and/or deletion of features. This procedure reduces the search problem to a kind of “astronavigation”. This map is also called as “landmark”.

![image](https://user-images.githubusercontent.com/79766032/114278167-83faeb80-99fc-11eb-8cdb-ffc7ccafd543.png)

We have developed a fast way of indexing constellation maps. Fingerprint hashes are formed from the constellation map, in which pairs of time-frequency points are combinatorially associated. Anchor points are chosen, each anchor point having a target zone associated with it. Each anchor point is sequentially paired with points within its target zone, each pair yielding two frequency components plus the time difference between the points.

Each hash can be packed into a 32-bit unsigned integer. Each hash is also associated with the time offset from the beginning of the respective file to its anchor point.

Hash Generation:
![image](https://user-images.githubusercontent.com/79766032/114278184-94ab6180-99fc-11eb-97b9-48bf64d3aa7b.png)

Database Construction:

To create a database index, the operation is carried out on each track in a database to generate a corresponding list of hashes and their associated offset times. Track IDs also be appended to the small data structures, yielding an aggregate 64-bit structure, 32 bits for the hash and 32 bits for the time offset and track ID.

Searching Method:

In Wang’s algorithm, by forming pairs instead of searching for matches against individual constellation points we gain a tremendous acceleration in the search process. 
To perform a search, the fingerprinting step is performed on a captured sample sound file to generate a set of hash-time offset records. Each hash from the sample is used to search in the database for matching hashes. If the files match, matching features should occur at similar relative offsets from the beginning of the file, i.e. a sequence of hashes in one file should also occur in the matching file with the same relative time sequence.

Conclusion:

The algorithm performs well with significant levels of noise and even non-linear distortion. It can correctly identify music in the presence of voices, traffic noise, dropout, and even other music.
















