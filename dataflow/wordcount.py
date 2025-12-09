"""
WordCount Pipeline - Counts word frequency in text files
Author: Your Name
Date: December 2024
"""
import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
import argparse
import re

class SplitWords(beam.DoFn):
    """
    DoFn to split lines into words and clean them
    DoFn = 'Do Function' - performs per-element processing
    """
    def process(self, element):
        """
        Process one line at a time

        Args:
            element: One line from the input file (string)

        Yields:
            Individual words (strings)
        """
        # Remove punctuation and convert to lowercase
        line = re.sub(r'[^\w\s]', '', element.lower())
        # Split into words
        words = line.split()
        # Yield each word
        for word in words:
            if word:  # Skip empty strings
                yield word

class FormatOutput(beam.DoFn):
    """
    Format the (word, count) pairs for output
    """
    def process(self, element):
        """
        Args:
            element: Tuple of (word, count)

        Yields:
            Formatted string
        """
        word, count = element
        yield f'{word}: {count}'

def run(argv=None):
    """
    Main function to run the pipeline
    """
    # Parse command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--input',
        required=True,
        help='Input file pattern (e.g., gs://bucket/input/*.txt)'
    )
    parser.add_argument(
        '--output',
        required=True,
        help='Output file prefix (e.g., gs://bucket/output/counts)'
    )
    known_args, pipeline_args = parser.parse_known_args(argv)

    # Pipeline options
    pipeline_options = PipelineOptions(pipeline_args)

    # Create the pipeline
    with beam.Pipeline(options=pipeline_options) as p:
        # Step 1: Read lines from input file
        lines = p | 'ReadFromText' >> beam.io.ReadFromText(known_args.input)

        # Step 2: Split lines into words
        words = lines | 'SplitWords' >> beam.ParDo(SplitWords())

        # Step 3: Create (word, 1) pairs
        word_pairs = words | 'PairWithOne' >> beam.Map(lambda word: (word, 1))

        # Step 4: Group by word and sum counts
        word_counts = word_pairs | 'GroupAndSum' >> beam.CombinePerKey(sum)

        # Step 5: Format for output
        output = word_counts | 'FormatOutput' >> beam.ParDo(FormatOutput())

        # Step 6: Write to output file
        output | 'WriteToText' >> beam.io.WriteToText(known_args.output)

if __name__ == '__main__':
    run()