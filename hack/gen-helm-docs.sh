#!/usr/bin/env bash
set -eu

# Generate helm-docs for Helm charts
                                                                                                                                                                                                                            
# require helm-docs
command -v helm-docs >/dev/null 2>&1 || {
    echo >&2 "helm-docs (https://github.com/norwoodj/helm-docs) is not installed. Aborting."
    exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Templates to copy into each chart directory
templates="${repository}/hack/templates"
readme="${templates}/README.md.gotmpl"
readme_config="${templates}/README_CONFIG.md.gotmpl"
readme_changelog="${templates}/README_CHANGELOG.md.gotmpl"

# Gather all charts using the common library, excluding common-test
charts=$(find "${repository}" -name "Chart.yaml")
root="${repository}/charts"

for chart in ${charts}; do
    chart_dir="$(dirname "${chart}")"
    echo "-] Copying templates to ${chart_dir}"
    # Copy README template into each Chart directory, overwrite if exists
    cp "${readme}" "${chart_dir}"
    # Copy CONFIG template to each Chart directory, do not overwrite if exists
    cp -n "${readme_config}" "${chart_dir}" || true
    # Copy CHANGELOG template to each Chart directory, do not overwrite if exists
    cp -n "${readme_changelog}" "${chart_dir}" || true
done

# Run helm-docs for charts using the common library and the common library itself
helm-docs \
    --ignore-file="${repository}/.helmdocsignore" \
    --template-files="${readme}" \
    --template-files="${readme_config}" \
    --template-files="${readme_changelog}" \
    --chart-search-root="${root}"