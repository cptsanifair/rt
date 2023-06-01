use strict;
use warnings;

use RT::Test tests => undef;

# test RT::Transaction->QuoteContent
{
    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/plain',
            Quote => 1,
            Content => 'foo',
            ContentType => 'text/plain',
        );
        is $got, "> foo", "ok";
    }

    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/html',
            Quote => 1,
            Content => '< jane & joe >',
            ContentType => 'text/plain',
        );
        is $got,
            '<blockquote class="gmail_quote" type="cite">'
            .'<pre style="white-space: pre-wrap; font-family: monospace;">'
            .'&lt; jane &#38; joe &gt;'
            .'</pre></blockquote>',
            "ok",
        ;
    }

    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/html',
            Quote => 1,
            Content => '<stron>jane & joe</strong>',
            ContentType => 'text/html',
        );
        is $got,
            '<blockquote class="gmail_quote" type="cite">'
            .'<stron>jane & joe</strong>'
            .'</blockquote>',
            "ok",
        ;
    }

    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/plain',
            Quote => 1,
            Content => '<stron>jane & joe</strong>',
            ContentType => 'text/html',
        );
        is $got,
            "> jane & joe\n",
            "ok",
        ;
    }

    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/html',
            Quote => 1,
            QuoteHeader => 'Nemo wrote:',
            Content => '<stron>jane & joe</strong>',
            ContentType => 'text/html',
        );
        is $got,
            '<div class="gmail_quote">Nemo wrote:<br />'
            .'<blockquote class="gmail_quote" type="cite">'
            .'<stron>jane & joe</strong>'
            .'</blockquote>'
            .'</div>',
            "ok",
        ;
    }

    {
        my $got = RT::Transaction->QuoteContent(
            Type => 'text/plain',
            Quote => 1,
            QuoteHeader => 'Nemo wrote:',
            Content => 'foo',
            ContentType => 'text/plain',
        );
        is $got, "Nemo wrote:\n> foo", "ok";
    }

}

done_testing();