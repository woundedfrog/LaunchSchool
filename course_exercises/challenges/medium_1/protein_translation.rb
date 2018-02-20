=begin

Protein Translation

Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"
There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.

There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"
Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--

Below are the codons and resulting Amino Acids needed for the exercise.

Codon	Protein
AUG	Methionine
UUU, UUC	Phenylalanine
UUA, UUG	Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	Tyrosine
UGU, UGC	Cysteine
UGG	Tryptophan
UAA, UAG, UGA	STOP
=end

=begin
input: protein RNA string
output: list of protein names

Algorithm:
split string into 3 sections - each containing 3 letters. (Codons)
iterate over the codons
  check each 3letter string with the codons in a hash.
if the current string matches a hash value
  push the corresponding key into the Protein array.
if a stop codon is found
  stop iteration
  return final protein array
=end
class InvalidCodonError < StandardError
end

class Translation
  PROTEINS = {'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'], 'Leucine' => ['UUA', 'UUG'], 'Serine' => ['UCU', 'UCC', 'UCA', "UCG"], 'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'], 'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA']}.freeze

  def self.of_codon(codon)
    raise InvalidCodonError  if !PROTEINS.values.flatten.include?(codon)
    PROTEINS.select { |prot, codon_list| prot if codon_list.include?(codon) }.keys.first
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{3}/)
    codons.take_while { |codon| !PROTEINS["STOP"].include?(codon) }.map { |codon| of_codon(codon) }
  end
end
