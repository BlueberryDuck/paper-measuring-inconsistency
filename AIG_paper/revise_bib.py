import bibtexparser, os


def remove_properties_from_bib(file_path):
    # Read the .bib file
    with open(file_path, "r") as bib_file:
        bib_database = bibtexparser.load(bib_file)

    # Remove 'abstract' and 'file' properties from all entries
    for entry in bib_database.entries:
        if "abstract" in entry:
            del entry["abstract"]
        if "file" in entry:
            del entry["file"]

    # Write the modified entries back to the .bib file
    with open(file_path, "w") as bib_file:
        bibtexparser.dump(bib_database, bib_file)


if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.realpath(__file__))
    file_path = os.path.join(script_dir, "references.bib")
    remove_properties_from_bib(file_path)
    print(f"Processed file: {file_path}")
