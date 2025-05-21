#!/bin/bash

# Create directories for Performance Analyzer config
mkdir -p pa-config/node1
mkdir -p pa-config/node2

# Create empty files needed by Performance Analyzer
touch pa-config/node1/plugin-stats-metadata
touch pa-config/node2/plugin-stats-metadata

# Create performance-analyzer.properties files with basic configuration
cat > pa-config/node1/performance-analyzer.properties << EOF
opensearch.performanceanalyzer.metrics.log.enabled: true
EOF

cat > pa-config/node2/performance-analyzer.properties << EOF
opensearch.performanceanalyzer.metrics.log.enabled: true
EOF

# Set proper permissions as recommended in OpenSearch logs
chmod 700 pa-config/node1 pa-config/node2
chmod 600 pa-config/node1/plugin-stats-metadata pa-config/node2/plugin-stats-metadata
chmod 600 pa-config/node1/performance-analyzer.properties pa-config/node2/performance-analyzer.properties

echo "Performance Analyzer directories and files created successfully."
echo "You can now run: docker-compose up -d"