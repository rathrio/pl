% I tested these by loading this file into a swipl repl,
% e.g. "swipl -s Assignment11.pl"
sentence --> subject, predicate(without_oject).
sentence --> article, noun, predicate(for_article_noun_subjects), object.
sentence --> pronoun, predicate(for_pronoun_subjects), object.

subject --> article, noun.
subject --> pronoun.

predicate(without_oject) --> [sleeps].
predicate(for_article_noun_subjects) --> [likes].
predicate(for_pronoun_subjects) --> [is].

object --> article, noun.

article --> [a].
article --> [the].
article --> [that].
article --> [this].

pronoun --> [this].
pronoun --> [that].

noun --> [boy].
noun --> [girl].

% Copy and paste these into the repl
% sentence([this,is,a,sleeps],[]).        % --> false.
% sentence([this,is,a,likes],[]).         % --> false.
% sentence([the,boy,likes],[]).           % --> false.
% sentence([that,boy,likes],[]).          % --> false.
% sentence([a,boy,the,the,girl],[]).      % --> false.
% sentence([this,is,a,boy],[]).           % --> true.
% sentence([that,is,the,girl],[]).        % --> true.
% sentence([the,girl,likes,a,girl],[]).   % --> true.

% Additional tests
% sentence([a,boy,is,a,boy],[]).          % --> false.
% sentence([this,likes,a,girl],[]).       % --> false.