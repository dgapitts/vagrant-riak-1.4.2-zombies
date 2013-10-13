import riak

client = riak.RiakClient(pb_port=10017, protocol='pbc')
zombie_bucket = client.bucket('za')

# We're creating the user data & keying off their username.
new_zombie = zombie_bucket.new('zombie1', data={
    "city": "Jackson",
    "long": "-90.183518",
    "dna": "TACGGATATTGGCCACAATCGACGTATGCGGCGTTCGGCTTGCTTGGGTGGATAGGCCGTGTTTATCTTATAATTTATGTCTAGGGTACTGCGTATACCACTTCGATCACACAGGAATCGCGGAGGTCGATCGAACTCGGCTTCGGACATCTATAAATAAGAGGAGAGCTGGATTTATAAGCTTACGTTGTTATGTGTCGCAACTCACTGGTGCGTTGACGCGACGGGGTCGCGCGCTATGAAAGTAGATATTCTTTTTGGCTATGTAAATCGGTGCATCGGGCATAACACGCAGATCCAAGGGATTATTTCCTACGACTCTGTCGTTCGCCCAGAAGTATAGATGGACGTTCGCGCCATTCCCGCGCGGGCACCTGGTCCCCT",
    "name": "Anthony J Dacosta",
    "zip": "39201",
    "dob": "3/25/1970",
    "social": "662-718-2255",
    "weight": "214.5",
    "sex": "male",
    "phone": "587-03-9892",
    "state": "MS",
    "blood": "B+",
    "address": "2600 Rafe Lane",
    "lat": "32.368619",
    "height": "5' 9\"",
    "occupation": "Economist",
})

# Note that the user hasn't been stored in Riak yet.
new_zombie.store()
